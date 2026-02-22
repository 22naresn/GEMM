# 2026-02-19T12:45:50.104057800
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.create_hls_component(name = "asic_imp",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="asic_imp")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

vitis.dispose()

