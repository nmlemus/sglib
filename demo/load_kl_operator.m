function K=load_kl_operator( name, version, r_i_k, r_k_alpha, I_r, I_u, stiffness_func, type, varargin )

options=varargin2options( varargin );
[silent,options]=get_option( options, 'silent', true );
[show_timings,options]=get_option( options, 'show_timings', false );
[use_waitbar,options]=get_option( options, 'use_waitbar', false );
check_unsupported_options( options, mfilename );

op_filename=[name '.mat'];
K=cached_funcall(...
    @compute_kl_pce_operator,...
    { r_i_k, r_k_alpha, I_r, I_u, stiffness_func, type }, ...
    1,...
    op_filename, ...
    version, ...
    'message', sprintf( 'recomputing kl-operator: %s', type ), ...
     'show_timings', show_timings, 'silent', silent, ...
     'extra_params', {'show_timings', show_timings, 'silent', silent}...
);
