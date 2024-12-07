import { WebSocketGateway, SubscribeMessage, WebSocketServer, OnGatewayConnection, OnGatewayDisconnect, MessageBody } from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { TalkService } from './talk.service';

@WebSocketGateway({
  cors: {
    origin: '*',
    methods: ['GET', 'POST'],
    allowedHeaders: ['*'],
    credentials: true,
  },
})
export class TalkGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer() server: Server;
  private users = new Map(); // Storing users by their socket.id

  constructor(private readonly talkService: TalkService) {}

  handleConnection(client: Socket) {
    console.log(`Client connected: ${client.id}`);
    this.users.set(client.id, client); 
    this.talkService.userConnected(client.id);
  }

  handleDisconnect(client: Socket) {
    console.log(`Client disconnected: ${client.id}`);
    this.users.delete(client.id);
    this.talkService.userDisconnected(client.id);
  }

  @SubscribeMessage('message')
  handleMessage(@MessageBody() message: any, client: Socket): void {
    this.talkService.userSendMessage(message, message.mysocketid, this.server);
  }

  @SubscribeMessage('joinRoom')
  handleJoinRoom(client: Socket): void {
    this.talkService.userJoinedRoom(client.id, this.server);
  }

  @SubscribeMessage('leaveRoom')
  handleLeaveRoom(client: Socket): void {
    this.talkService.userLeftRoom(client.id);
  }

  @SubscribeMessage('skip')
  handleSkip(client: Socket): void {
    this.talkService.userSkip(client.id, this.server);
  }
}
