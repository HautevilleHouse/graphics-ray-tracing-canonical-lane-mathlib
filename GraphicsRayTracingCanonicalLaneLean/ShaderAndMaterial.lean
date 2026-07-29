import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure ShaderAndMaterialPackage {O : RayTracingAdmittedObject} where
  materialModel : Prop
  bsdfEvaluation : Prop
  textureMapping : Prop
  shadingNormal : Prop

structure ShaderAndMaterialEvidence {O : RayTracingAdmittedObject}
    (S : ShaderAndMaterialPackage O) where
  materialModelClosed : S.materialModel
  bsdfEvaluationClosed : S.bsdfEvaluation
  textureMappingClosed : S.textureMapping
  shadingNormalClosed : S.shadingNormal

def ShaderAndMaterialClosed {O : RayTracingAdmittedObject}
    (S : ShaderAndMaterialPackage O) : Prop :=
  S.materialModel ∧ S.bsdfEvaluation ∧
  S.textureMapping ∧ S.shadingNormal

theorem shader_and_material_closed_from_evidence
    {O : RayTracingAdmittedObject} (S : ShaderAndMaterialPackage O)
    (E : ShaderAndMaterialEvidence S) : ShaderAndMaterialClosed S := by
  exact And.intro E.materialModelClosed
    (And.intro E.bsdfEvaluationClosed
      (And.intro E.textureMappingClosed E.shadingNormalClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse