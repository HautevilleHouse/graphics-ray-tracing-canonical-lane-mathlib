import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure BVHNode (T : Type u) where
  boundingBox : Type v
  left : Option (BVHNode T)
  right : Option (BVHNode T)
  primitives : List T

structure BVHAccelerationPackage (T : Type u) where
  root : BVHNode T
  hierarchyComplete : Prop
  regionBased : Prop
  traversalCorrect : Prop

structure BVHAccelerationEvidence {T : Type u} (B : BVHAccelerationPackage T) where
  hierarchyCompleteClosed : B.hierarchyComplete
  regionBasedClosed : B.regionBased
  traversalCorrectClosed : B.traversalCorrect

def BVHAccelerationClosed {T : Type u} (B : BVHAccelerationPackage T) : Prop :=
  B.hierarchyComplete ∧ B.regionBased ∧ B.traversalCorrect

theorem bvh_acceleration_closed_from_evidence {T : Type u} (B : BVHAccelerationPackage T) (E : BVHAccelerationEvidence B) : BVHAccelerationClosed B := by
  exact And.intro E.hierarchyCompleteClosed
    (And.intro E.regionBasedClosed E.traversalCorrectClosed)

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse