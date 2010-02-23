function unittest_scaled_distance
% UNITTEST_COVARIANCE_FUNCS Test the COVARIANCE_FUNCS function.
%
% Example (<a href="matlab:run_example unittest_covariance_funcs">run</a>)
%   unittest_covariance_funcs
%
% See also COVARIANCE_FUNCS, TESTSUITE 

%   Elmar Zander
%   Copyright 2010, Inst. of Scientific Comuting
%   $Id$ 
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

munit_set_function( 'private/scaled_distance' );
assert_equals( scaled_distance( 1, 2, 1, 0 ), 1, 'one' );
assert_equals( scaled_distance( 0, 3, 0.5, 0 ), 6, 'six' );
assert_equals( scaled_distance( 1, [], 2, 0 ), 0.5, 'no_x2' );

assert_equals( scaled_distance( 0, 3, 1, 0 ), 3, 'smooth0' );
assert_equals( scaled_distance( 0, 3, 1, 4 ), 1, 'smooth4' );

assert_equals( scaled_distance( [3 1], [7 3], 2, 0 ), [2 1], 'n2' );
assert_equals( scaled_distance( [0 1 2; 6 7 8], [1 2 3; 4 5 6], 2, 0 ), sqrt(5/4)*[1 1 1], 'n3d2' );
assert_equals( scaled_distance( [0 1 2; 6 7 8], [1 2 3; 4 5 6], [0.5 2], 0 ), sqrt(5)*[1 1 1], 'n3d2l2' );


% rest is their own unittests
% this one should go 
