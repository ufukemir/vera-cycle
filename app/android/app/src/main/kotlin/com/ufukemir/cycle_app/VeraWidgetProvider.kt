package com.ufukemir.cycle_app

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

/**
 * Renders the three strings HomeWidgetService writes. Reads only from the
 * plugin's shared preferences — the widget never touches the encrypted
 * cycle store, so a lock-screen render can't leak logged data.
 */
class VeraWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val data = HomeWidgetPlugin.getData(context)
        for (id in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.vera_widget).apply {
                setTextViewText(
                    R.id.widget_eyebrow,
                    data.getString("vera_eyebrow", "Vera")
                )
                setTextViewText(
                    R.id.widget_headline,
                    data.getString("vera_headline", "")
                )
                val secondary = data.getString("vera_secondary", "") ?: ""
                setTextViewText(R.id.widget_secondary, secondary)
                setViewVisibility(
                    R.id.widget_secondary,
                    if (secondary.isEmpty()) View.GONE else View.VISIBLE
                )
            }
            appWidgetManager.updateAppWidget(id, views)
        }
    }
}
