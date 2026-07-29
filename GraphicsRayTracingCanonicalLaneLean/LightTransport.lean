import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure LightTransportPackage {O : RayTracingAdmittedObject} where
  raySurfaceInteraction : Prop
  bidirectionalScatteringDistribution : Prop
  pathIntegralFormulation : Prop
  monteCarloEstimation : Prop

structure LightTransportEvidence {O : RayTracingAdmittedObject}
    (L : LightTransportPackage O) where
  raySurfaceInteractionClosed : L.raySurfaceInteraction
  bidirectionalScatteringDistributionClosed : L.bidirectionalScatteringDistribution
  pathIntegralFormulationClosed : L.pathIntegralFormulation
  monteCarloEstimationClosed : L.monteCarloEstimation

def LightTransportClosed {O : RayTracingAdmittedObject}
    (L : LightTransportPackage O) : Prop :=
  L.raySurfaceInteraction ∧ L.bidirectionalScatteringDistribution ∧
  L.pathIntegralFormulation ∧ L.monteCarloEstimation

theorem light_transport_closed_from_evidence
    {O : RayTracingAdmittedObject} (L : LightTransportPackage O)
    (E : LightTransportEvidence L) : LightTransportClosed L := by
  exact And.intro E.raySurfaceInteractionClosed
    (And.intro E.bidirectionalScatteringDistributionClosed
      (And.intro E.pathIntegralFormulationClosed E.monteCarloEstimationClosed))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse