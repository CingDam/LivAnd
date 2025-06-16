
import 'express-session';

declare module 'express-session' {
  interface SessionData {
    
    user?: {
      user_num: number;
      user_email: string;
      user_nickname: string;
    };
  
}
}