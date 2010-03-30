function write_tex_include( name, figdir, graphicstype, psfrag_list )

tex_filename=make_filename( name, figdir, 'tex' );
eps_filename=make_filename( name, '', graphicstype, '-psf' ); % filename must be relative
makesavepath( tex_filename );

fid=fopen( tex_filename, 'w' );
if fid==-1
    warning( 'write_tex_include:fopen', 'could not open file: %s for writing (%s)\nAborting function...', tex_filename, msg );
    return
end
for i=1:length(psfrag_list)
    %fprintf(fid, '\\PSReplAny{%s}{%s}\n', psfrag_list{i}{1}, psfrag_list{i}{2} );
    fprintf(fid, '\\psfrag{%s}[%s][%s][1][0]{{%s %s}}\n', psfrag_list{i}{1}, psfrag_list{i}{4}, psfrag_list{i}{4}, psfrag_list{i}{3}, psfrag_list{i}{2} );
end
fprintf(fid, '\\includegraphics[width=0.8\\textwidth]{%s}\n', eps_filename );
fclose(fid);

