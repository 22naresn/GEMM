# 2025-09-08T14:15:45.414499800
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="sep6")
comp.run(operation="IMPLEMENTATION")

vitis.dispose()

