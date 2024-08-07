import jwt, { JwtPayload } from 'jsonwebtoken';
import constants from '../config/constants.config';

export const signAccessToken = async (payload: JwtPayload): Promise<string> => {
  return new Promise<string>((resolve, reject) => {
    jwt.sign(payload, constants.accessTokenSecret, { expiresIn: constants.accessTokenSpan }, (err, token) => {
      if (err) reject(err);
      resolve(token as string);
    });
  });
};

export const signRefreshToken = async (payload: JwtPayload): Promise<string> => {
  return new Promise<string>((resolve, reject) => {
    jwt.sign(payload, constants.refreshTokenSecret, { expiresIn: constants.refreshTokenSpan }, async (err, token) => {
      if (err) reject(err);
      resolve(token as string);
    });
  });
};

export const verifyAccessToken = async (accessToken: string): Promise<string | JwtPayload> => {
  return new Promise<string | JwtPayload>((resolve, reject) => {
    jwt.verify(accessToken, constants.accessTokenSecret, (err, decoded) => {
      if (err) return reject(err);
      resolve(decoded as JwtPayload | string);
    });
  });
};

export const verifyRefreshToken = async (refreshToken: string): Promise<JwtPayload> => {
  return new Promise<JwtPayload>((resolve, reject) => {
    jwt.verify(refreshToken, constants.refreshTokenSecret, async (err, decoded) => {
      if (err) return reject(err);
      resolve(decoded as JwtPayload);
    });
  });
};
