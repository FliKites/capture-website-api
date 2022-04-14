export const getDefaultTimeoutSeconds = () => parseInt(process.env.TIMEOUT) || 20;
export const getConcurrency = () => parseInt(process.env.CONCURRENCY) || 33;
export const getMaxQueueLength = () => parseInt(process.env.MAX_QUEUE_LENGTH) || 33;
export const getShowResults = () => process.env.SHOW_RESULTS || 'true';
export const getSecret = () => process.env.SECRET;
export const browser = await puppeteer.launch({
      headless: true,
      ignoreHTTPSErrors: true,
      args: [
        "--proxy-server='http://127.0.0.1:808/'",
        '--proxy-bypass-list=*',
        '--disable-gpu',
        '--disable-dev-shm-usage',
        '--disable-setuid-sandbox',
        '--no-first-run',
        '--no-sandbox',
        '--no-zygote',
        '--single-process',
        '--ignore-certificate-errors',
        '--ignore-certificate-errors-spki-list',
        '--enable-features=NetworkService'
      ]
    });
