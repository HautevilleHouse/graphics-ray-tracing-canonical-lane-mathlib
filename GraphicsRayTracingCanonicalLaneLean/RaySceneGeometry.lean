import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure Ray where
  origin : Vector3
  direction : Vector3

deriving Repr, DecidableEq

structure Vector3 where
  x : ℝ
  y : ℝ
  z : ℝ

deriving Repr, DecidableEq

structure Scene where
  primitives : List Primitive
  lights : List Light
  camera : Camera

deriving Repr, DecidableEq

structure Primitive where
  shape : Shape
  material : Material

deriving Repr, DecidableEq

inductive Shape where
  | sphere (center : Vector3) (radius : ℝ)
  | triangle (p1 p2 p3 : Vector3)
  | plane (normal : Vector3) (offset : ℝ)

deriving Repr, DecidableEq

structure Material where
  color : Vector3
  reflectance : ℝ
  transparency : ℝ
  refractiveIndex : ℝ

deriving Repr, DecidableEq

structure Light where
  position : Vector3
  color : Vector3
  intensity : ℝ

deriving Repr, DecidableEq

structure Camera where
  position : Vector3
  lookAt : Vector3
  up : Vector3
  fov : ℝ

deriving Repr, DecidableEq

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse