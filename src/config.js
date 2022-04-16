export const getDefaultTimeoutSeconds = () => parseInt(process.env.TIMEOUT) || 90;
export const getConcurrency = () => parseInt(process.env.CONCURRENCY) || 99;
export const getMaxQueueLength = () => parseInt(process.env.MAX_QUEUE_LENGTH) || 99;
export const getShowResults = () => process.env.SHOW_RESULTS || 'true';
export const getSecret = () => process.env.SECRET;
