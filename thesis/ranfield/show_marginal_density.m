function show_marginal_density

% Show that created random fields indeed show the right marginal densities
tic

N=50;

[els,pos,bnd]=create_mesh_1d( N, 0, 1 );
G_N=mass_matrix( els, pos );

% load the kl variables of the conductivity k
% define stochastic parameters
for i=1:3
    switch i
        case 1
            dist='beta';
            dist_params={4,2};
            rng=[0,1.2];
        case 2
            dist='lognormal';
            dist_params={0.3,0.5};
            rng=[0,5];
        case 3
            dist='exponential';
            dist_params={0.5};
            rng=[-1,7];
    end
    dist_shift=0.1;
    dist_scale=1;
    
    
    
    for p_k=1:4
        m_k=4;
        l_k=4;
        lc_k=0.3;
        
        stdnor_k=@(x)(gendist_stdnor(dist,x,dist_params,dist_shift,dist_scale));
        pdf_k=@(x)(gendist_pdf(dist,x,dist_params,dist_shift,dist_scale));
        [mu_k,var_k]=gendist_moments(dist,dist_params,dist_shift,dist_scale);
        
        cov_k={@gaussian_covariance,{lc_k,1}};
        % create field
        [k_i_alpha, I_k]=expand_field_pce_sg( stdnor_k, cov_k, [], pos, G_N, p_k, m_k );
        [mu_k_i,k_i_k,kappa_k_alpha]=pce_to_kl( k_i_alpha, I_k, l_k, G_N );
        
        toc
        
        x=linspace(rng(1),rng(2));
        y_ex=pdf_k(x);
        y_rf=pce_pdf( x, k_i_alpha(1,:), I_k, 'N', 100000 );
        y_rf2=pce_pdf( x, k_i_alpha(10,:), I_k, 'N', 100000 );
        y_rf3=pce_pdf( x, k_i_alpha(30,:), I_k, 'N', 100000 );
        y_rf4=pce_pdf( x, k_i_alpha(50,:), I_k, 'N', 100000 );
        clf;
        hold on;
        plot(x, y_ex, 'k', 'LineWidth', 2 );
        plot(x, y_rf, 'g' );
        plot(x, y_rf2, 'g' );
        plot(x, y_rf3, 'g' );
        plot(x, y_rf4, 'g' );
        hold off;
        save_figure( 'ranfield_marginal_density-%s-p%d', {dist,p_k} );
        userwait;
    end
end

