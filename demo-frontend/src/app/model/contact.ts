import { User } from "./user";

export class Contact {
  id: number;
  name: string;
  login: string;
  password: string;
  surname1: string;
  surname2: string;
  phone: number;
  email: string;
  user: User;
}