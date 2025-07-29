function getEnv(key: string) {
  const value = process.env[key];
  if(value === undefined) throw new Error(`${key} on env has not found!`);
  return value;
}

const ENV = {
  PORT: getEnv('PORT'),
  JWT: getEnv('JWT'),
};

export default ENV;