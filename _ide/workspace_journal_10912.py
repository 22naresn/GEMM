# 2025-10-31T12:40:02.327573500
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="sep6")
comp.run(operation="C_SIMULATION")

vitis.dispose()

