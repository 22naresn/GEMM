# 2025-09-06T21:19:19.261942
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.create_hls_component(name = "sep6",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="sep6")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

vitis.dispose()

