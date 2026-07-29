import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.RaytracingCore

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure AccelerationStructurePackage {R : RaytracingCorePackage} (RCore : R) where
  bvhBuilt : Prop
  gridPartition : Prop
  traversalAlgorithm : Prop
  memoryCoherence : Prop

structure AccelerationStructureEvidence {R : RaytracingCorePackage}
    {RCore : R} (A : AccelerationStructurePackage RCore) where
  bvhBuiltClosed : A.bvhBuilt
  gridPartitionClosed : A.gridPartition
  traversalAlgorithmClosed : A.traversalAlgorithm
  memoryCoherenceClosed : A.memoryCoherence

def AccelerationStructureClosed {R : RaytracingCorePackage}
    {RCore : R} (A : AccelerationStructurePackage RCore) : Prop :=
  A.bvhBuilt ∧ A.gridPartition ∧ A.traversalAlgorithm ∧ A.memoryCoherence

theorem acceleration_structure_closed_from_evidence
    {R : RaytracingCorePackage} {RCore : R} (A : AccelerationStructurePackage RCore)
    (E : AccelerationStructureEvidence A) : AccelerationStructureClosed A := by
  exact And.intro E.bvhBuiltClosed
    (And.intro E.gridPartitionClosed
      (And.intro E.traversalAlgorithmClosed E.memoryCoherenceClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse