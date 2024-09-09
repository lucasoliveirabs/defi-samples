import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const WDPCModule = buildModule("WDPC", (m) => {
  const wdpc = m.contract("WDPC");
  return { wdpc };
});

export default WDPCModule;