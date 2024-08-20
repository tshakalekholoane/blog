use core::slice;
use std::ffi::c_long;

/// Searches for a target in a sorted array and returns the position
/// where the target is or could be.
///
/// # Safety
///
/// If a is not null, it must be aligned and point to n c_longs.
#[no_mangle]
pub unsafe extern "C" fn binary_search(
  a: *const c_long,
  n: c_long,
  x: c_long,
) -> c_long {
  if a.is_null() {
    return -1;
  }
  let s = unsafe { slice::from_raw_parts(a, n as usize) };
  debug_assert!(s.is_sorted(), "a is not sorted");
  s.binary_search(&x).unwrap_or_else(|i| i) as c_long
}
