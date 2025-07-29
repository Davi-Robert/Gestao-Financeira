import * as argon2 from "argon2";

export default class Password{
  private password: string;
  public hash: string;

  constructor(password: string){
    if(typeof password != 'string') throw new Error("wrong type for passwords");
    this.password = password;

    (async()=>{
      const optionsHash = {
          hashLength: 32,
          timeCost: 5,
        }
        try{
          this.hash = await argon2.hash(this.password, optionsHash);
        }catch(err){
          throw new Error('password coudnt be hashed: ',err);
        }
    })();
  }
  public static async verify(hash: string, password: string): Promise<boolean>{
    let match: boolean = false;
    try{
      match = await argon2.verify(hash,password)
    }catch (err){
      throw new Error('Argon had an internal failure', err);
    }
    return match;
  }
}