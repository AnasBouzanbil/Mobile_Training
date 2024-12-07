import { Injectable } from '@nestjs/common';
import e from 'express';

@Injectable()
export class TalkService {
  private users = new Map(); // Storing users by their socket.id
  private rooms = new Map();
  private roomQueue: string[] = []; // Ensure roomQueue is always an array of socketIds

  userConnected(socketId: string) {
    this.users.set(socketId, { id: socketId });
    console.log(`User ${socketId} connected`);
  }

  userDisconnected(socketId: string) {
    this.users.delete(socketId);
    this.roomQueue = this.roomQueue.filter((id) => id !== socketId);
    console.log(`User ${socketId} disconnected`);
  }

  userJoinedRoom(socketId: string, socket: any) {
    console.log(`User ${socketId} joined a room`);
    if (this.roomQueue.length > 1) {
      const userOneId = this.roomQueue.shift();
      const userTwoId = this.roomQueue.shift();

      if (userOneId && userTwoId) {
        this.rooms.set(userOneId, userTwoId);
        this.rooms.set(userTwoId, userOneId); 
        socket.to(userOneId).emit('roomCreated', userTwoId);
        socket.to(userTwoId).emit('roomCreated', userOneId);
        console.log(`Room created between ${userOneId} and ${userTwoId}`);
      }
    } else {
      this.roomQueue.push(socketId);
      console.log(`User ${socketId} added to the queue    ` + this.roomQueue.length);
      if (this.roomQueue.length > 1) {
        const userOneId = this.roomQueue.shift();
        const userTwoId = this.roomQueue.shift();
        
        if (userOneId && userTwoId) {
          this.rooms.set(userOneId, userTwoId);
          this.rooms.set(userTwoId, userOneId); 
          socket.to(userOneId).emit('roomCreated', userTwoId);
          socket.to(userTwoId).emit('roomCreated', userOneId);
          console.log(`Room created between ${userOneId} and ${userTwoId}`);
        }
      } 
    }
  }

  userLeftRoom(socketId: string) {
    if (this.rooms.has(socketId)) {
      const userOneId = socketId;
      const userTwoId = this.rooms.get(userOneId);
      if (userTwoId) {
        this.roomQueue.push(userOneId, userTwoId); // Ensure both users are added back to the queue
        this.rooms.delete(userOneId);
        this.rooms.delete(userTwoId);
        console.log(`Users ${userOneId} and ${userTwoId} have left the room`);
      }
    }
  }

  userSendMessage(message: any, socketId: string, server: any) {
    console.log(`User ${socketId} sent a message: ${message.message}`);
    if (this.rooms.has(socketId)) {
      const userOneId = socketId;
      const userTwoId = this.rooms.get(userOneId);
      // Emit the message to the other user
      if (userOneId === socketId) {
        server.to(userTwoId).emit('message', {message: message.message, senderId : userOneId});
      } else {
        server.to(userOneId).emit('message', {message: message.message, senderId : userTwoId});
      }
    }
  }  
     
  userSkip(socketId: string, server: any) {
    if (this.rooms.has(socketId)) {
      const userOneId = socketId;
      const userTwoId = this.rooms.get(userOneId);
      this.roomQueue.push(userOneId, userTwoId);
      this.rooms.delete(userOneId);
      this.rooms.delete(userTwoId);
      if (userTwoId == socketId) {
        server.to(userOneId).emit('roomDestroyed');
      }
      else {
        server.to(userTwoId).emit('roomDestroyed');
      }
      console.log(`Users ${userOneId} and ${userTwoId} have been skipped`);
    }
  }
}
