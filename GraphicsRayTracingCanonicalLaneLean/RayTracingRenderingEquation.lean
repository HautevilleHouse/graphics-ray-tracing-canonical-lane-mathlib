import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RayTracingRenderingEquationPackage where
  sceneGeometry : Type u
  lightSources : Type v
  bsdfModel : Type w
  surfaceInteraction : Prop
  radianceTransfer : Prop
  transportEquation : Prop

structure RayTracingRenderingEquationEvidence (P : RayTracingRenderingEquationPackage) where
  surfaceInteractionClosed : P.surfaceInteraction
  radianceTransferClosed : P.radianceTransfer
  transportEquationClosed : P.transportEquation

def RayTracingRenderingEquationClosed (P : RayTracingRenderingEquationPackage) : Prop :=
  P.surfaceInteraction ∧ P.radianceTransfer ∧ P.transportEquation

theorem ray_tracing_rendering_equation_closed_from_evidence
    (P : RayTracingRenderingEquationPackage)
    (E : RayTracingRenderingEquationEvidence P) :
    RayTracingRenderingEquationClosed P := by
  exact And.intro E.surfaceInteractionClosed
    (And.intro E.radianceTransferClosed E.transportEquationClosed)

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse