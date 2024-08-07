import { IConstants } from '../interfaces/config.interface';

/**
 * For value that will constant in the app
 */
const constants: IConstants = {
  baseUrl: import.meta.env.VITE_BACKEND_BASE_URL as string,
  // baseUrl: 'http://localhost:5000',
  matchBaseUrl: import.meta.env.VITE_MATCH_BACKEND_BASE_URL as string,
};

export default constants;
