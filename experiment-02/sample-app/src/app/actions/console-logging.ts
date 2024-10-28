'use server';

export default async function consoleLogging() {
    const isoString = new Date().toISOString();
    console.log(`Console log: ${isoString}`);
    console.info(`Console info: ${isoString}`);
    console.warn(`Console warn: ${isoString}`);
    console.error(`Console error: ${isoString}`);
}