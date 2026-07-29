import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RayTracingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure RayTracingAdmittedObject where
  space : RayTracingSpace
  sceneStructure : Prop
  lightTransportModel : Prop
  imagePlane : Type
  imageTopology : TopologicalSpace imagePlane
  renderingEquationClosed : Prop
  conclusion : renderingEquationClosed

structure RayTracingEndgameState where
  object : RayTracingAdmittedObject

def RayTracingWitnessClosed (O : RayTracingAdmittedObject) : Prop :=
  O.renderingEquationClosed

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse