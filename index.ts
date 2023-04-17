import express, {Request,Response,Application} from 'express';
import * as dotenv from "dotenv";
import cors from "cors";
import helmet from "helmet";

dotenv.config();
const app:Application = express();
app.use(helmet());
app.use(cors());
app.use(express.json());


const PORT = process.env.PORT || 8000;
app.get("/", (req:Request, res:Response):void => {
    res.send("Hello Typescript with Node.js!!!")
  });
  app.listen(PORT, ():void => {
    console.log(`Server Running here 👉 http://localhost:${PORT}`);
  });