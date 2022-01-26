import fs from "fs"; // Filesystem
import path from "path"; // Path routing
import Generator from "./generator"; // Generator
import {logger} from "./utils/logger"; // Logging
import csv from "csv-parser";

// Config file path
const configPath: string = path.join(__dirname, "../config.json");
const DROP_TOTAL:number = 10000000;
/**
 * Throws error and exists process
 * @param {string} erorr to log
 */
function throwErrorAndExit(error: string): void {
    logger.error(error);
    process.exit(1);
}

(async () => {
    let accountsConfig:any = {};
    const args = process.argv.slice(2);
    if (args.length > 0 && args[0] !== "") {
        if (!fs.existsSync(args[0])) {
            throwErrorAndExit("imported file does not exist Please add.");
        }

        const getAccountsFromCSV = async function (filePath: string) {

            return new Promise((resolve, reject) => {
                const parsedAccounts: any = [];
                fs.createReadStream(filePath)
                    .pipe(csv())
                    .on('data', function (data: any) {
                        try {

                            parsedAccounts.push('0x' + data.account.slice(2));
                            //perform the operation
                        } catch (err: any) {
                            //error handler
                            throwErrorAndExit(err);
                        }
                    })
                    .on('end', function () {
                        resolve(parsedAccounts)
                    });
            })
        }

        const accounts:any = await getAccountsFromCSV(args[0]);
        const dropValue = Math.floor(DROP_TOTAL/accounts.length);
        accounts.map((account:string) => {
            accountsConfig[account] = dropValue;
        })

        // Read config
        const configFile: Buffer = await fs.readFileSync(configPath);
        const configData = JSON.parse(configFile.toString());

        configData['airdrop'] = accountsConfig;
        await fs.writeFileSync(configPath, JSON.stringify(configData));

        return process.exit(0);

    }
    // Check if config exists
    if (!fs.existsSync(configPath)) {
        throwErrorAndExit("Missing config.json. Please add.");
    }

    // Read config
    const configFile: Buffer = await fs.readFileSync(configPath);
    const configData = JSON.parse(configFile.toString());

    // Check if config contains airdrop key
    if (configData["airdrop"] === undefined) {
        if (Object.keys(accountsConfig).length > 0) {

        } else {
            throwErrorAndExit("Missing airdrop param in config. Please add.");
        }
    }

    // Collect config
    const decimals: number = configData.decimals ?? 18;
    const airdrop: Record<string, number> = configData.airdrop;

    // Initialize and call generator
    const generator = new Generator(decimals, airdrop);
    await generator.process();
})();
