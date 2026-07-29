import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RayTracingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure RayTracingAdmittedObject where
  space : RayTracingSpace
  sceneGeometry : Prop
  lightTransport : Prop
  renderingEquation : Prop
  conclusion : Prop

structure RayTracingEndgameState where
  object : RayTracingAdmittedObject

def RayTracingWitnessClosed (O : RayTracingAdmittedObject) : Prop :=
  O.conclusion

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse