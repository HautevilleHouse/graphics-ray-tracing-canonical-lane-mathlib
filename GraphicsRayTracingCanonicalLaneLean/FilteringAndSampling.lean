import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure FilteringAndSamplingPackage {O : RayTracingAdmittedObject} where
  antialiasingFilter : Prop
  importanceSampling : Prop
  lowDiscrepancySequence : Prop
  multipleImportanceSampling : Prop

structure FilteringAndSamplingEvidence {O : RayTracingAdmittedObject}
    (F : FilteringAndSamplingPackage O) where
  antialiasingFilterClosed : F.antialiasingFilter
  importanceSamplingClosed : F.importanceSampling
  lowDiscrepancySequenceClosed : F.lowDiscrepancySequence
  multipleImportanceSamplingClosed : F.multipleImportanceSampling

def FilteringAndSamplingClosed {O : RayTracingAdmittedObject}
    (F : FilteringAndSamplingPackage O) : Prop :=
  F.antialiasingFilter ∧ F.importanceSampling ∧
  F.lowDiscrepancySequence ∧ F.multipleImportanceSampling

theorem filtering_and_sampling_closed_from_evidence
    {O : RayTracingAdmittedObject} (F : FilteringAndSamplingPackage O)
    (E : FilteringAndSamplingEvidence F) : FilteringAndSamplingClosed F := by
  exact And.intro E.antialiasingFilterClosed
    (And.intro E.importanceSamplingClosed
      (And.intro E.lowDiscrepancySequenceClosed E.multipleImportanceSamplingClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse