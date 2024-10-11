import { rmSync } from "fs";

const path = "./dist";

try {
  rmSync(path, { recursive: true, force: true });
  console.log(`Successfully removed: ${path}`);
} catch (error) {
  console.error(`Error removing ${path}:`, error);
}
