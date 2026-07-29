import GraphicsRayTracingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RayTracingAdmittedObject where
  scene : Type
  camera : Type
  lightTransportAlgorithm : Type
  renderingEquationSatisfied : Prop
  conclusion : renderingEquationSatisfied

def RayTracingWitnessClosed (O : RayTracingAdmittedObject) : Prop :=
  O.renderingEquationSatisfied

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse
