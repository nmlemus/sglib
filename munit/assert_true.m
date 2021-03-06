function assert_true( bool_val, message, assert_id  )
% ASSERT_TRUE Asserts that the given condition is true.
%   ASSERT_TRUE( BOOL_VAL, MESSAGE, ASSERT_ID, OPTIONS ) checks that
%   the condition given in BOOL_VAL is true; otherwise issues an assertion.
%   A message telling the user what went wrong can be passed in MESSAGE.
%   For a description of OPTIONS see ASSERT.
%
% Example (<a href="matlab:run_example assert_true">run</a>)
%   % The following assertion fails.
%   x=-19;
%   assert_true( x>0, 'x must be a positive number' );
%
% See also ASSERT_FALSE, ASSERT_EQUALS

%   Elmar Zander
%   Copyright 2006, Institute of Scientific Computing, TU Braunschweig.
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version.
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.


if nargin<3
    assert_id='';
end
if nargin<2
    message='Assertion failed (no message specified).';
end

result_list={};
if ~bool_val
    result_list{end+1}={message, assert_id};
end
munit_process_assert_results( result_list, assert_id );
