# 2026-02-22T16:05:56.417356600
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.create_hls_component(name = "ASIC",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="ASIC")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

