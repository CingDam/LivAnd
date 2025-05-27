// packages/config/tailwind.config.ts
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "../../packages/ui/src/**/*.{ts,tsx}",
    "../../apps/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        background: "var(--background)",
        foreground: "var(--foreground)",
      },
      spacing: {
        '33': '135px',
      }
    },
  },
  plugins: [],
};

export default config;
