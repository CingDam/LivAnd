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
      },
      transitionDuration: {
        '1300' : '1300ms',
        '2000' : '2000ms',
        '3000' : '3000ms',
        '4000' : '4000ms',
        '5000' : '5000ms',
      },
      keyframes: {
        slideDown: {
          "0%" : { transform: "translateY(-60px)" },
          "100%" : { transform: "translateY(0)" }
        }
      },
      animation: {
        slideDown: "slideDown 1s ease-out forwards"
      }
    },
  },
  plugins: [],
};

export default config;
