# 2026-02-23T21:55:08.414419400
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/GEMM")

comp = client.get_component(name="ASIC")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

vitis.dispose()

