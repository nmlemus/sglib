function unittest_subspace_angle
% UNITTEST_SUBSPACE_ANGLE Test the SUBSPACE_ANGLE function.
%
% Example (<a href="matlab:run_example unittest_subspace_angle">run</a>)
%   unittest_subspace_angle
%
% See also SUBSPACE_ANGLE, TESTSUITE 

%   Elmar Zander
%   Copyright 2010, Inst. of Scientific Computing, TU Braunschweig
%   $Id$ 
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

munit_set_function( 'subspace_angle' );

clc
e1=unitvector(1,4);
e2=unitvector(2,4);
e3=unitvector(3,4);
e4=unitvector(4,4);

test([e1, e2], [e1, e1]);
test([e1, e2], [e1, e3]);
test([e1, e2], [e3, e4]);
test([e1, e2], [e1, -e2+e4]);
test([e1, e2, 0*e1], [e1, e2, e3]);

function test(A1,A2)
theta=subspace_angle(A1,A2);
dist=subspace_distance(A1,A2);
[dist, sin(theta(2))]
