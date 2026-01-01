# 2025-11-05T10:56:35.304431400
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="sep6")
comp.run(operation="CO_SIMULATION")

