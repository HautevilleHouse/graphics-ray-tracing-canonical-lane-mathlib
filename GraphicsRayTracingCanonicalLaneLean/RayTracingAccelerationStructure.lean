import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure AccelerationStructurePackage where
  spatialIndex : Type u
  treeConstruction : Prop
  rayTraversal : Prop
  intersectionEfficient : Prop

structure AccelerationStructureEvidence (A : AccelerationStructurePackage) where
  treeConstructionClosed : A.treeConstruction
  rayTraversalClosed : A.rayTraversal
  intersectionEfficientClosed : A.intersectionEfficient

def AccelerationStructureClosed (A : AccelerationStructurePackage) : Prop :=
  A.treeConstruction ∧ A.rayTraversal ∧ A.intersectionEfficient

theorem acceleration_structure_closed_from_evidence
    (A : AccelerationStructurePackage)
    (E : AccelerationStructureEvidence A) :
    AccelerationStructureClosed A := by
  exact And.intro E.treeConstructionClosed
    (And.intro E.rayTraversalClosed E.intersectionEfficientClosed)

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse