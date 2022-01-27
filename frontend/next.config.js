/** @type {import('next').NextConfig} */
module.exports = {
  redirects: [
    {
      source: "http://drop.aphra.finance/",
      destination: "https://drop.aphra.finance",
      type: 301,
    },
  ],
  reactStrictMode: true,
  exportPathMap: async function (
    defaultPathMap,
    { dev, dir, outDir, distDir, buildId }
  ) {
    return {
      "/": { page: "/index" },
      "/claim": { page: "/claim" },
    };
  },
};
