import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getServices(): string {

    //read a json file jsonDB/Clubs.json and return the data and sending to broswrer and showing it in a good condition
    const fs = require('fs');
    const data = fs.readFileSync('./jsonDB/Services.json');
    const clubs = JSON.parse(data);
    console.log(clubs);
    return JSON.stringify(clubs);

  }
  getSchools(): string {
      
      //read a json file jsonDB/Clubs.json and return the data and sending to broswrer and showing it in a good condition
      const fs = require('fs');
      const data = fs.readFileSync('./jsonDB/Schools.json');
      const schools = JSON.parse(data);
      return JSON.stringify(schools);
  
    }
    getAnnouncements(): string {
        
        //read a json file jsonDB/Clubs.json and return the data and sending to broswrer and showing it in a good condition
        const fs = require('fs');
        const data = fs.readFileSync('./jsonDB/Announcment.json');
        const announcements = JSON.parse(data);
        return JSON.stringify(announcements);
    
      }
      getClubs(): string {

        //read a json file jsonDB/Clubs.json and return the data and sending to broswrer and showing it in a good condition
        const fs = require('fs');
        const data = fs.readFileSync('./jsonDB/Clubs.json');
        const clubs = JSON.parse(data);
        return JSON.stringify(clubs);
    
      }
      getEvents(): string {

        //read a json file jsonDB/Clubs.json and return the data and sending to broswrer and showing it in a good condition
        const fs = require('fs');
        const data = fs.readFileSync('./jsonDB/Events.json');
        const events = JSON.parse(data);
        return JSON.stringify(events);
    
      }
}
