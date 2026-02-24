# 2026-02-24T21:57:47.835014800
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="ASIC")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

