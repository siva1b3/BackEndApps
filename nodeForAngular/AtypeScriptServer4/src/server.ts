// server.ts
import app from "./app";

const PORT: number = 4300;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
