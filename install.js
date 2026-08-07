const readline = require("readline");
const { execSync } = require("child_process");

const rl = readline.createInterface({ input: process.stdin, output: process.stdout });

function menu() {
  console.clear();
  console.log(`
========================================
             SPYPANEL INSTALLER
========================================

1. Install Panel
2. Uninstall Panel
3. Create Node
4. Soon
5. Exit

========================================`);
  rl.question("Choose an option [1-5]: ", async (answer) => {
    if (answer === "1") {
      try {
        console.log("\nInstalling dependencies...");
        execSync("npm install", { stdio: "inherit" });
        console.log("\nSpyPanel installed.");
        console.log("Starting on port 6767...\n");
        execSync("node server.js", { stdio: "inherit" });
      } catch (e) {
        console.error("\nInstallation failed:", e.message);
        rl.close();
      }
    } else if (answer === "2") {
      console.log("\nUninstall is intentionally limited to this project's files.");
      console.log("Delete the SpyPanel folder to remove the project.");
      rl.close();
    } else if (answer === "3") {
      console.log("\nCreate Node: Coming Soon!");
      rl.close();
    } else if (answer === "4") {
      console.log("\nComing Soon!");
      rl.close();
    } else if (answer === "5") {
      rl.close();
    } else {
      console.log("\nInvalid option.");
      setTimeout(menu, 900);
    }
  });
}
menu();
