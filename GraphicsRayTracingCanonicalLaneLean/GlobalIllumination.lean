import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.SurfaceShading

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure GlobalIlluminationPackage {S : SurfaceShadingPackage} (Shading : S) where
  pathIntegralFormulation : Prop
  monteCarloIntegration : Prop
  pathTermination : Prop
  indirectLightAccumulation : Prop

structure GlobalIlluminationEvidence {S : SurfaceShadingPackage}
    {Shading : S} (G : GlobalIlluminationPackage Shading) where
  pathIntegralFormulationClosed : G.pathIntegralFormulation
  monteCarloIntegrationClosed : G.monteCarloIntegration
  pathTerminationClosed : G.pathTermination
  indirectLightAccumulationClosed : G.indirectLightAccumulation

def GlobalIlluminationClosed {S : SurfaceShadingPackage}
    {Shading : S} (G : GlobalIlluminationPackage Shading) : Prop :=
  G.pathIntegralFormulation ∧ G.monteCarloIntegration ∧ G.pathTermination ∧ G.indirectLightAccumulation

theorem global_illumination_closed_from_evidence
    {S : SurfaceShadingPackage} {Shading : S} (G : GlobalIlluminationPackage Shading)
    (E : GlobalIlluminationEvidence G) : GlobalIlluminationClosed G := by
  exact And.intro E.pathIntegralFormulationClosed
    (And.intro E.monteCarloIntegrationClosed
      (And.intro E.pathTerminationClosed E.indirectLightAccumulationClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse