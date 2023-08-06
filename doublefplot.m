function fig = doublefplot(X_f,f,xlims,ylims,figTitle)
%DOUBLEFPLOT Plot real and imaginary components of a double-sided frequency
%spectrum, |X_f| in frequency domain |f|, showing positive and negative
% frequencies defined by the (positive) xlims.
%   xlims and ylims are both arrays of min and max values.


% Scale frequecy for MHz range 
f = f/1e6;
xlims = xlims/1e6;

% Frequency domain plot
fig = figure;
tiled = tiledlayout(1,2,'TileSpacing','compact');  % Create tiled chart
bgAx = axes(tiled,'XTick',[],'YTick',[],'Box','off');
bgAx.Layout.TileSpan = [1 2];
title(figTitle);
% negative range
ax1 = axes(tiled);
yyaxis(ax1,'left');
stem(ax1,f,real(X_f),'.');
ylim(ylims);
yyaxis(ax1,'right');
stem(ax1,f,imag(X_f),'.');
ylim(ylims);
ax1.YAxis(2).Visible = "off";
ax1.Box = 'off';
xlim(ax1,-1*[xlims(2),xlims(1)]);
xline(ax1,-1*xlims(1),':');
xlabel("negative frequency (MHz)")
% positive range
ax2 = axes(tiled);
ax2.Layout.Tile = 2;    % Move axes to second tile in layout
yyaxis(ax2,'left');
stem(ax2,f,real(X_f),'.');
ylim(ylims);
yyaxis(ax2,'right');
stem(ax2,f,imag(X_f),'.');
ylim(ylims);
ytickformat('%gj');
ax2.Box = 'off';
ax2.YAxis(1).Visible = 'off';
xlim(ax2,xlims);
xline(ax2,xlims(1),':');
linkaxes([ax1 ax2], 'y');   % Link both y axes
xlabel("positive frequency (MHz)")


end

