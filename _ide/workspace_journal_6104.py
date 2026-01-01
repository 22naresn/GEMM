# 2025-09-22T09:46:06.073873500
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="sep6")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="PACKAGE")

comp.run(operation="IMPLEMENTATION")

vitis.dispose()

