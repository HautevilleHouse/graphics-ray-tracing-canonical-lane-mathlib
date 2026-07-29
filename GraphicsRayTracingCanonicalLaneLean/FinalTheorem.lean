import canonicalLaneMathlib.AdmissibleClass
import GraphicsRayTracingCanonicalLaneLean.RayIntersection
import GraphicsRayTracingCanonicalLaneLean.BVHAcceleration
import GraphicsRayTracingCanonicalLaneLean.RenderingEquation

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

def ConstrainedRayTracingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ray_tracing_endgame (A : AdmissibleClass) : ConstrainedRayTracingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse