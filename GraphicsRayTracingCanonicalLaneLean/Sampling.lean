import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure PixelSample where
  u : ℝ
  v : ℝ

deriving Repr, DecidableEq

structure SamplerPackage where
  imageWidth : ℕ
  imageHeight : ℕ
  samplesPerPixel : ℕ
  samplePattern : List PixelSample
  patternGenerated : Prop
  randomOffset : Prop

deriving Repr, DecidableEq

structure SamplerEvidence (S : SamplerPackage) where
  patternGeneratedClosed : S.patternGenerated
  patternLengthCorrect : List.length S.samplePattern = S.samplesPerPixel
  samplesInUnitSquare : ∀ s ∈ S.samplePattern, 0 ≤ s.u ∧ s.u ≤ 1 ∧ 0 ≤ s.v ∧ s.v ≤ 1

def SamplerClosed (S : SamplerPackage) : Prop :=
  S.patternGenerated ∧ (List.length S.samplePattern = S.samplesPerPixel)

theorem sampler_closed_from_evidence (S : SamplerPackage) (E : SamplerEvidence S) : SamplerClosed S :=
  And.intro E.patternGeneratedClosed E.patternLengthCorrect

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse