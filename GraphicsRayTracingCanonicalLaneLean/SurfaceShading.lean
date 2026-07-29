import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure SurfaceShadingPackage where
  brdfDefined : Prop
  lightSampling : Prop
  specularReflection : Prop
  diffuseReflection : Prop
  refractionModel : Prop

structure SurfaceShadingEvidence (S : SurfaceShadingPackage) where
  brdfDefinedClosed : S.brdfDefined
  lightSamplingClosed : S.lightSampling
  specularReflectionClosed : S.specularReflection
  diffuseReflectionClosed : S.diffuseReflection
  refractionModelClosed : S.refractionModel

def SurfaceShadingClosed (S : SurfaceShadingPackage) : Prop :=
  S.brdfDefined ∧ S.lightSampling ∧ S.specularReflection ∧ S.diffuseReflection ∧ S.refractionModel

theorem surface_shading_closed_from_evidence (S : SurfaceShadingPackage) (E : SurfaceShadingEvidence S) :
    SurfaceShadingClosed S := by
  exact And.intro E.brdfDefinedClosed
    (And.intro E.lightSamplingClosed
      (And.intro E.specularReflectionClosed
        (And.intro E.diffuseReflectionClosed E.refractionModelClosed)))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse