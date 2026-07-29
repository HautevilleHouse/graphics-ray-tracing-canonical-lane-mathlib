import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.GlobalIllumination

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure DenoisingOutputPackage {GI : GlobalIlluminationPackage Shading}
    {S : SurfaceShadingPackage} {Shading : S} (GlobalIllum : GI) where
  spatialFilter : Prop
  temporalAccumulation : Prop
  artifactReduction : Prop
  finalPixelRender : Prop

structure DenoisingOutputEvidence {GI : GlobalIlluminationPackage Shading}
    {S : SurfaceShadingPackage} {Shading : S} {GlobalIllum : GI}
    (D : DenoisingOutputPackage GlobalIllum) where
  spatialFilterClosed : D.spatialFilter
  temporalAccumulationClosed : D.temporalAccumulation
  artifactReductionClosed : D.artifactReduction
  finalPixelRenderClosed : D.finalPixelRender

def DenoisingOutputClosed {GI : GlobalIlluminationPackage Shading}
    {S : SurfaceShadingPackage} {Shading : S} {GlobalIllum : GI}
    (D : DenoisingOutputPackage GlobalIllum) : Prop :=
  D.spatialFilter ∧ D.temporalAccumulation ∧ D.artifactReduction ∧ D.finalPixelRender

theorem denoising_output_closed_from_evidence
    {GI : GlobalIlluminationPackage Shading} {S : SurfaceShadingPackage}
    {Shading : S} {GlobalIllum : GI} (D : DenoisingOutputPackage GlobalIllum)
    (E : DenoisingOutputEvidence D) : DenoisingOutputClosed D := by
  exact And.intro E.spatialFilterClosed
    (And.intro E.temporalAccumulationClosed
      (And.intro E.artifactReductionClosed E.finalPixelRenderClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse