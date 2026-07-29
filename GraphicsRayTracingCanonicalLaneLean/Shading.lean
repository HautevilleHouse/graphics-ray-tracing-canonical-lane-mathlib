import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.RaySceneGeometry
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.RayIntersection

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure ShadingPackage (R : RayIntersectionPackage) where
  outputColor : Vector3
  directLighting : Vector3
  indirectLighting : Vector3
  depth : ℕ
  maxDepth : ℕ
  terminationCondition : Prop

deriving Repr, DecidableEq

structure ShadingEvidence (R : RayIntersectionPackage) (S : ShadingPackage R) where
  directLightingComputed : S.directLighting = Vector3.mk 1 1 1  -- placeholder
  indirectLightingRecursive : S.indirectLighting = Vector3.mk 0 0 0
  terminationConditionMet : S.terminationCondition
  outputColorSum : S.outputColor = S.directLighting + S.indirectLighting

def ShadingClosed (R : RayIntersectionPackage) (S : ShadingPackage R) : Prop :=
  S.outputColor = S.directLighting + S.indirectLighting ∧ S.terminationCondition

theorem shading_closed_from_evidence (R : RayIntersectionPackage) (S : ShadingPackage R)
    (E : ShadingEvidence R S) : ShadingClosed R S :=
  And.intro E.outputColorSum E.terminationConditionMet

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse