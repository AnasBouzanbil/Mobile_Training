import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  // this will read a tweets.json file and return the contents
  getTweets(): string {
    try {
      const fs = require('fs');
      const tweets = fs.readFileSync('src/tweets.json', 'utf8');
      console.log(tweets);
      return tweets;
    } catch (err) {
      console.error(err);
      return 'Error reading tweets';
  }
  }
}
